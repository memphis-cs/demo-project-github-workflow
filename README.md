# Demo: Workflow for Submitting Project Work

**Video Coming Soon!**

In this demonstration, I will explain the workflow to follow for submitting project work in this course. The workflow mostly follows the popular [GitHub Flow](https://guides.github.com/introduction/flow/) workflow.

## Things to Do at the Very Beginning

Before you begin development iterations, there are couple things that must be set up.

### Configure Project Repo

- Disable _squash_ and _rebase_ merging. These forms of merging effectively change the commit history, and can cause confusion for the purposes of this course. Here is a [GitHub Help article on squash and rebase merging](https://help.github.com/articles/about-pull-request-merges/).
- Add branch protection rule for `master` branch that requires pull request reviews before merging. Here is a [GitHub Help article on branch protection](https://help.github.com/articles/configuring-protected-branches/).

### Create a `reporting` Branch

- This branch will be used to edit the various reporting documents, such as the individual assignments specs and the instructions to instructors documents. The reason for using a separate branch is that we don't want these sort of changes to be forced through the same code-review process that the rest of the project code is.
- Unlike the topic branches below, this branch will be shared by all teammates, and all team members will be able to push to it without creating a pull request.
- To set up the branch from the `master` branch, one team member first creates and checks out the branch using this command:
  - `git checkout -b reporting`
- To share the branch with the rest of team via GitHub, run this command:
  - `git push -u origin reporting`

## Things to Do at the Start of Each Iteration

At the start of each development iteration, there are a couple things you must do.

### Create a GitHub Milestone

- Prior to starting an iteration, your team must create a milestone for the iteration in GitHub. Here is a [GitHub Help article on milestones](https://help.github.com/articles/about-milestones/)
- You need to do this only once per milestone in GitHub.
- It is used to group issues and pull requests that contribute to a particular milestone.

### Create Individual Assignment Specs in the `reporting` Branch

- The team must plan their individual assignment specifications at the start of each iteration.
- These changes should be committed/pushed to the `reporting` branch.
- They will be merged into the `master` branch at the end of the iteration.

## Performing Development Tasks for an Iteration

Follow the following steps for each task you perform during an iteration.

### Step 1: Create an Issue for Your Task

- When you start a task, create an issue for the task.
  - Use the exact same task title as the one in your individual assignment specs.
  - Set the _Labels_ to _enhancement_ if it's developing new features/functionality. If the task aims to fix a bug in existing functionality, set _Labels_ to _bug_.
  - Set the _Milestone_ to the appropriate milestone.
  - You may ignore the _Assignees_ and _Projects_ settings. We won't be using them in this course.

### Step 2: Create a Topic Branch

- You will do all your work in this topic branch.
- Use a branch-naming convention like this:
  - `iss3` where the associated issue is issue #3.
- From the `master` branch, you might use this command to create the branch and check it out:
  - `git checkout -b iss3`
- The first time you push the topic branch, use this command to set the upstream branch (assuming that the topic branch is named `iss3`):
  - `git push -u origin iss3`
- After you run the above push command, you can push and pull from the branch using the shorter forms:
  - `git push`
  - `git pull`

### Step 3: Complete Your Task in the Topic Branch

- With the topic branch is checked out, make changes, commit them locally, and push them to GitHub. All changes made this way should be fully contained in the topic branch.
- If changes are merged into the `master` branch while you are working on your topic branch, you will need merge them into your topic branch before you're done. From your topic branch, you can use this command to merge the remote master branch into your topic branch (although you may need to manually resolve merge conflicts after the command):
  - `git pull origin master`

### Step 4: Create a Pull Request (PR)

- Once your task is completed, create a pull request in GitHub.
  - Make the title the exact same as the corresponding issue title.
  - Add a comment "Closes #3" in the description (assuming that the issue is issue #3). This will link the PR with its corresponding issue and will automatically close the issue when the PR is closed. Here is a [GitHub Help article on using keywords in PR comments to close issues](https://help.github.com/articles/closing-issues-using-keywords/).
  - Set the _Reviewers_ to your team's QA Czars for the iteration, that is, the ones who will review PRs.
  - Set the _Labels_ and _Milestone_ to be the same as they were in the issue.
- If other PRs are merged into the `master` branch before this one is, you will need to merge those changes into your topic branch before your PR can be merged.

### Step 5: Review/Revise/Accept the Pull Request

- It is the job of a QA Czar to review your pull request. They must test it to make sure that it works and confirm that it can be fast-forward merged with the `master` branch. They must post comments or change requests if they find issues.
- To test the code, the QA Czar can pull the branch to their local repository and check it out using these commands (assuming that the topic branch is named `iss3`):
  - `git fetch origin`
  - `git checkout -b iss3 origin/iss3`
- If changes are needed, the author of the topic branch should make them to their working copy and push them to GitHub (all still in that topic branch). The pull request will be automatically updated to reflect the changes. The author will probably also want to reply to the comment in the pull request, so the QA Czar is notified of what's happened.
- Once the QA Czar approves the change, they should also merge it into the `master` branch.

## Things to Do at the End of Each Iteration

At the end of each iteration, there are a few things you must do (mostly concerned with reporting/documenting).

- The team must update their individual assignment documents with the outcomes of their tasks. These changes should be committed/pushed to the `reporting` branch.
- The team must also create/commit/push an instructions-to-instructors document in the `reporting` branch.
- Someone must merge all changes made to the `master` branch into the `reporting` branch. This should be trivial because there should be no intersecting changesets. To checkout the reporting branch and do the merge, use these commands:
  - `git checkout reporting`
  - `git pull origin master`
- Someone other than the Project Coordinator must create a pull request for the `reporting` branch.
  - Make the title "Milestone _X_ Reporting", where _X_ is the number of the milestone being submitted.
  - Set the _Reviewers_ to your team's Project Coordinator for the iteration.
  - Set the _Labels_ to be _help wanted_.
  - Set the _Milestone_ to the appropriate milestone.
- The Project Coordinator must review the pull request, making sure that the documents pass muster and making/requesting any necessary corrections/changes. Once everything is ready to submit, the Project Coordinator approves the pull request and merges it into `master`.
- Don't forget that the instructions-to-instructors document (a PDF generated from Markdown) must be submitted to the appropriate dropbox as well.
