# Lab: Implement Deployment Pipelines

Implement deployment pipelines in Microsoft Fabric
Deployment pipelines in Microsoft Fabric let you automate the process of copying changes made to the content in Fabric items between environments like development, test, and production. You can use deployment pipelines to develop and test content before it reaches end users. In this exercise, you create a deployment pipeline, and assign stages to the pipeline. Then you create some content in a development workspace and use deployment pipelines to deploy it between the Development, Test and Production pipeline stages.

Note: To complete this exercise, you need to be an member of the Fabric workspace admin role. To assign roles see Roles in workspaces in Microsoft Fabric.

This lab takes approximately 20 minutes to complete.

!!! info "For this lab you need to navigate to QA Platform and login using the credentials provided"

!!! warning "It is important that you use an incognito/private mode browser tab and not your work or personal Microsoft login"

In this lab, you will sign in to Microsoft Fabric using the email and password from the QA Platform.

1. Using an **incognito/private mode browser tab** navigate to the [Fabric portal](https://app.fabric.microsoft.com/) at: https://fabric.microsoft.com

2. Follow the prompts, and sign in with the user credentials from the QA Platform:
    - Email
    - Password

After signing in, you will be redirected to the Fabric home page:

![Fabric home page](../img/qa-fabric-home.png)

## Create workspaces

Create three workspaces.

1. Navigate to the [Microsoft Fabric home page](https://app.fabric.microsoft.com/home?experience=fabric) in an incognito/private mode browser tab browser, and sign in with the Fabric credentials from the QA Platform.

2. In the menu bar on the left, select Workspaces (the icon looks similar to 🗇).

3. Create a new workspace named: **Development**

4. Create a new workspace named: **Test**

5. Create a new workspace named: **Production**

6. Select the **Workspaces** icon on the menu bar on the left and confirm that there are three workspaces named: Development, Test, and Production

    !!! note
        If you are prompted to enter a unique name for the workspaces, append one or more random numbers to the words: Development, Test, or Production.

## Create a deployment pipeline

Next, create a deployment pipeline.

1. In the menu bar on the left, select Workspaces.

2. Select Deployment Pipelines, then New pipeline.

3. In the Add a new deployment pipeline window, give the pipeline a unique name and select Next.

4. In the new pipeline window, select Create and continue.

## Assign workspaces to stages of a deployment pipeline

Assign workspaces to the stages of the deployment pipeline.

1. On the left menu bar, select the pipeline you created.

2. In the window that appears, expand the options under Assign a workspace on each deployment stage and select the name of the workspace that matches the name of the stage.

3. Select the check mark Assign for each deployment stage.

    ![Screenshot of deployment pipeline.](../img/21-deployment-pipeline.png)

## Create content

Fabric items haven’t been created in your workspaces yet. Next, create a lakehouse in the development workspace.

In the menu bar on the left, select Workspaces.
Select the Development workspace.
Select New Item.
In the window that appears, select Lakehouse and in the New lakehouse window, name the lakehouse, LabLakehouse.
Select Create.
In the Lakehouse Explorer window, select Start with sample data to populate the new lakehouse with data.
Screenshot of Lakehouse Explorer.

Select the sample NYCTaxi.
In the menu bar on the left, select the pipeline you created.
Select the Development stage, and under the deployment pipeline canvas you can see the lakehouse you created as a stage item. In the left edge of the Test stage, there’s an X within a circle. The X indicates that the Development and Test stages aren’t synchronized.
Select the Test stage and under the deployment pipeline canvas you can see that the lakehouse you created is only a stage item in the source, which in this case refers to the Development stage.
Screenshot the deployment pipeline showing content mismatches between stages.

Deploy content between stages
Deploy the lakehouse from the Development stage to the Test and Production stages.

Select the Test stage in the deployment pipeline canvas.
Under the deployment pipeline canvas, select the checkbox next to the Lakehouse item. Then select the Deploy button to copy the lakehouse in its current state to the Test stage.
In the Deploy to next stage window that appears, select Deploy. There is now an X in a circle in the Production stage in the deployment pipeline canvas. The lakehouse exists in the Development and Test stages but not yet in the Production stage.
Select the Production stage in the deployment canvas.
Under the deployment pipeline canvas, select the checkbox next to the Lakehouse item. Then select the Deploy button to copy the lakehouse in its current state to the Production stage.
In the Deploy to next stage window that appears, select Deploy. The green check marks between the stages indicates that all stages in sync and contain the same content.
Using deployment pipelines to deploy between stages also updates the content in the workspaces corresponding to the deployment stage. Let’s confirm.
In the menu bar on the left, select Workspaces.
Select the Test workspace. The lakehouse was copied there.
Open the Production workspace from the Workspaces icon on the left menu. The lakehouse was copied to the Production workspace too.
Clean up
In this exercise, you created a deployment pipeline, and assigned stages to the pipeline. Then you created content in a development workspace and deployed it between pipeline stages using deployment pipelines.

In the left navigation bar, select the icon for each workspace to view all of the items it contains.
In the menu on the top toolbar, select Workspace settings.
In the General section, select Remove this workspace.

---
<small><b>Source:
https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/21-implement-cicd.html
</b></small>
