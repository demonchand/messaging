PVR_PREFIX = "PVR_"

rails_repo = 'spec/rails_repo'

def get_current_branch
  %x[git branch | grep ^* | sed "s/\* //"].chop
end

def rails_version
  current_branch= get_current_branch
  current_branch.include?( PVR_PREFIX) ? current_branch.split("_")[1] : (ENV["version"] || "master")
end
rails_app = "spec/rails_app_#{rails_version}"

desc "check for test app"
task :PluginsVsRails do
end

namespace :PluginsVsRails do

  desc "post_commit"
  task :post_commit do
    current_branch = 'master'
    current_commit_msg = %x[git log -1 --pretty=format:%s #{current_branch}]
    test_branches = %w[PVR_master_v2.2.2 PVR_master_v2.3.2]

    test_branches.each do |branch|
      %x[git checkout #{branch}]
      puts "git merge -m '#{current_commit_msg}' #{current_branch}"
      %x[git merge -m '#{current_commit_msg}' #{current_branch}]
    end

    %x[git checkout #{current_branch}]
    %x[git push origin #{test_branches.join(" ")}]

    %x[touch PluginsVsRails]
  end

  namespace :branch do

    desc "list"
    task :list do
      all_branches = %x[git branch]
      active_branch = ENV['active_branch'] || get_current_branch
      new_branch = "#{PVR_PREFIX}#{active_branch}_#{rails_version}"
      `git branch`
    end

    desc "create"
    task :create do
      active_branch = ENV['active_branch'] || get_current_branch
      new_branch = "#{PVR_PREFIX}#{active_branch}_#{rails_version}"
      `git branch`
      puts "create"
    end

  end

end
