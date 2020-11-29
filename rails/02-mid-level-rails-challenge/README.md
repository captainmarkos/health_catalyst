# Create a CRUD application

## Introduction
At Health Catalyst, we import a lot of data for customers and partners.

We keep track of these imports and for this challenge you'll be creating a simplified version of our import tracking system.

For imports, the system needs to know when an import starts, ends, its duration, and the status (`queued`, `running`, `succeeded`, `failed`, or `cancelled`), the import's customer, and a readable identifier for the import.

For customers, the system needs to know their name, a url-safe readable subdomain, the customer's location, and the customer's partner.

For partners, the system needs to know their name and location.

Completing this challenge will require creating fake seed data for the resources referenced (`imports`, `customers`, and `partners`).

There are some things in these requirements that are not 100% defined. This is representative of what you are likely to experience on the job. Use discretion and make decisions to fill in any requirements gaps. There is not one right answer to this implementation.

## Challenge
1. Modify the existing rails application in the `data-import-app` subfolder to meet the requirements in the introduction and the rest of the points in this section
1. Write code that executes with `rails db:seed` that will enable someone to test your application without needing to create additional data for partners, customers, or imports
1. Create at least one model test and at least one request test in RSpec for the application
1. Create a page to view an import
1. Create a page to view a customer
    1. It should have a list of imports for the customer, ordered by the time they started (in descending order)
    1. The list of imports for a customer should be exportable as a CSV
1. Create a page to view all customers
    1. The page should list all attributes of the customers
    1. It should show the partner for the customer
    1. It should show the latest import for the customer, with a link to a page to view the import
    1. A user should be able to sort the data by each column displayed
    1. A user should be able to select the `status` of the import displayed, for example:
        1. If `succeeded` is selected, the latest successful import should be displayed/linked
        1. If `running` is selected, the latest running import should be displayed/linked
1. Optionally, leave notes and feedback (in `notes.md` and `feedback.md`)
1. Commit your changes, and include a commit message as if this was production code
