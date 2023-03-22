# ProjectHopper

Project Hopper provides a set of resources to offer containerized computing environments for students that are easy to use and work out-of-the-box.

Hopper assumes students are familiar with or will be trained in the basics of a `git` based workflow.

We recommend that you encourage students to use [Gitpod](https://gitpod.io/about) to host their workspaces. Gitpod provides a cloud-based IDE which integrates with Github and has a VSCode-like user interface. Gitpod is free for 50 hours a month and provides an excellent default Docker image if your program doesn't have its own. Note that you can shut down a workspace (click on the hamburger) rather than waiting for it to timeout. You can also pin a workspace so that it doesn't get deleted. Students can create their own repository for their portfolio.

## Getting Started

- Create a Github or Gitlab repository with the student-facing instruction materials for your program.

- Include a `.gitpod.yml` file in the root of your repo. This file wll tell Gitpod how to set up each workspace.

    This file points to the Docker image for your course. If your course has an image which is hosted by the college, the image name to use can be found on [Docker Hub](https://hub.docker.com/u/tesccnc), for example:

    ```yml
    image: tesccnc/datascience
    ```

    The default Gitpod workspace contains [these things](https://github.com/gitpod-io/workspace-images/blob/481f7600b725e0ab507fbf8377641a562a475625/dazzle.yaml#L18). If you want to just use the default image, you don't have to include a `.gitpod.yml` file.

    The `.gitpod.yml` file supports many other options. The documentation can be found on [gitpod.io](https://www.gitpod.io/docs/references/gitpod-yml).

## Setting up a Workspace

- Go to [gitpod.io](https://gitpod.io).
- Create an account with your Github so you can access private repositories.
- Select `New Workspace`, and paste in the full URL of the repo for your course.
    It may take a few moments to build.
- As an example, you can open this page as a workspace, which itself has a `.gitpod.yml` file in the root.

## Be Aware

Gitpod will **automatically delete** unused workspaces. The best way to protect against this is regularly committing local changes, but as extra protection, students can pin workspaces that need to be saved. Pinned workspaces are never deleted.

## Using Other Docker Hosts

As an alternative to Gitpod, students can host the Docker image on their local machines using a Docker client like [Docker Desktop](https://www.docker.com/products/docker-desktop/) or [Vagrant](https://www.vagrantup.com/). They can clone the repository onto their Docker image and set up [VSCode](https://code.visualstudio.com/docs/remote/ssh) or another IDE with SSH integration.

## Using a Custom Docker Image

To add features to your workspace or use your own, you can point your `.gitpod.yml` file at a custom Dockerfile like this:

```yml
image:
    file: .gitpod.Dockerfile
```

You can then add features to your Docker container [yourself](https://docs.docker.com/engine/reference/builder/), or you can create a help request with the Hopper team.

