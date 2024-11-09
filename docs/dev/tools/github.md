# GitHub

## Setup a secret on a repository

To add your created token to the repository secrets in GitHub, follow these steps:

---

### **1. Copy Your GitHub Token**

- Copy the token you generated. If you’ve already closed the page where the token was displayed, you will need to regenerate it because GitHub doesn’t allow you to view the token again.

---

### **2. Go to Your Repository Settings**

- Navigate to the repository where you want to add the token.
- Click on the **Settings** tab at the top of the repository.

---

### **3. Navigate to Secrets and Variables**

- In the left-hand sidebar, scroll down to **Secrets and variables** under **Security**.
- Click on **Actions** under this section.

---

### **4. Add a New Repository Secret**

- Click the **New repository secret** button.
- Fill out the fields:
  - **Name**: Use a clear and descriptive name like `ACTIONS_DEPLOY_TOKEN`.
  - **Secret**: Paste the token you copied earlier into this field.
- Click **Add secret** to save it.

---

### **5. Verify the Secret**

- The newly added secret will now be listed under the repository secrets, but its value will be hidden for security reasons.
- Reference this secret in your GitHub Actions workflow using `${{ secrets.ACTIONS_DEPLOY_TOKEN }}`.

---

### **6. Test the Workflow**

- Push a change to your repository or trigger the workflow manually to test if the secret is working as expected.

Let me know if you face any challenges!
