# Demo: Workflow for Submitting Project Work

## Prerequisites

### Configure Project Repo

- Disable _squash_ and _rebase_ merging. These forms of merging effectively change the commit history, and can cause confusion for the purposes of this course. Here is a [GitHub Help article on squash and rebase merging](https://help.github.com/articles/about-pull-request-merges/).
- Add branch protection rule for `master` branch that requires pull request reviews before merging. Here is a [GitHub Help article on branch protection](https://help.github.com/articles/configuring-protected-branches/).

### Create a GitHub Milestone

- Prior to starting an iteration, your team must create a milestone for the iteration in GitHub. Here is a [GitHub Help article on milestones](https://help.github.com/articles/about-milestones/)
- You need to do this only once per milestone in GitHub.
- It is used to group issues and pull requests that contribute to a particular milestone.

## Step 1: Create an Issue for Your Task

- When you start a task, create an issue for the task.
- Use the exact same task title as the one in your individual assignment specs.
- Set the _Labels_ to _enhancement_ if it's developing new features/functionality. If the task aims to fix a bug in existing functionality, set _Labels_ to _bug_.
- Set the _Milestone_ to the appropriate milestone.
- You may ignore the _Assignees_ and _Projects_ settings. We won't be using them in this course.
- Once the issue is created, make note of its issue number and enter it into your individual assignment specs document.

## Step 2: Create a Topic Branch

- You will do all your work in this topic branch.
- Use a branch-naming convention like this:
  - `iss3` where the associated issue is issue #3.
- From the `master` branch you might use this command to create the branch and check it out:
  - `git checkout -b iss3`

## Step 3: Complete Your Task in the Topic Branch

- The first time you push the topic branch, use this command to set the upstream branch (assuming that the topic branch is named `iss3`):
  - `git push -u origin iss3`
- After you run the above push command, you can push and pull from the branch using the shorter forms:
  - `git push`
  - `git pull`
- If changes are merged into the `master` branch while you are working on your topic branch, you will need merge them into your topic branch before you're done. From your topic branch, you can use this command to merge the remote master branch into your topic branch (although you may need to manually resolve merge conflicts after the command):
  - `git pull origin master`

## Step 4: Create a Pull Request (PR)

- Once your task is completed, create a pull request in GitHub.
- Make the title the exact same as the corresponding issue title.
- Add a comment "Closes #3" in the description (assuming that the issue is issue #3). This will link the PR with its corresponding issue and will automatically close the issue when the PR is closed. Here is a [GitHub Help article on using keywords in PR comments to close issues](https://help.github.com/articles/closing-issues-using-keywords/).
- Set the _Reviewers_ to your team's QA Czars for the iteration, that is, the ones who will review PRs.
- Set the _Labels_ and _Milestone_ to be the same as they were in the issue.
- Once the PR is created, make note of its number and enter it into your individual assignment specs document.

## Step 5: Review/Revise/Accept the Pull Request

- It is the job of a QA Czar to review your pull request. They must test it to make sure that it works and confirm that it can be fast-forward merged with the `master` branch. They must post comments or change requests if they find issues.
- To test the code, the QA Czar can pull the branch to their local repository and check it out using these commands (assuming that the topic branch is named `iss3`):
  - `git fetch origin`
  - `git checkout -b iss3 origin/iss3`
- If changes are needed, the author of the topic branch should make them to their working copy and push them to GitHub (all still in that topic branch). The pull request will be automatically updated to reflect the changes. The author will probably also want to reply to the comment in the pull request, so the QA Czar is notified of what's happened.
- Once the QA Czar approves the change, they should also merge it into the `master` branch.
