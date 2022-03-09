# GrooverTechTest

## Questions

### Scalability
- Strategy 1 - Vertical scaling: The most straighforwards way to scale a database is to give it more ressources (CPU, RAM and storage)
  - Advantages: Easy to do in managed services (like AWS RDS), avoid data integrity problems linked to sharding and similar strategies
  - Disavantages: Harder to do when self-managed/self-hosted, limited in max scaling by the quantity of resource that can be allowed physically, not highly available
- Strategy 2 - Horizontal scaling: Create multiple database instances that will each contain part of the data stored, also known as sharding.
  - Advantages: Unlimited scaling potential, highly available when done correctly, can spread datas on multiple availability zones
  - disadvantages: Need to be correctly configured to preserve data integrity and ensure that data are not lost on shard failure (not native in postgresql). 

### Security
A basic solution would be to implement a maximal number of request on the target endpoint per sender. In the case of a login it could be as simple as only accepting 3 tries per our for each usernames. To add to the login situation (or any user filled form) a captcha can also be used to mitigate the automation of the attack.

## Design choices and limitations

Idealy the .tfvars files should not be stored in git as they are susceptible to contain sensitive data. Whether they have to be store entirely in a secret manager (like vault for example) or templated with variables from a secured source will depend on your existing infrastructure and needs.

To split the environments I've chosen to use multiples directories. While it has the drawback of duplicating code, it allows to manage differences more easily between environments. It allow for example to create new resources for testing in the staging while keeping the production untouched if needed.

Another way would have been to have only one set of definitions with a .tfvars file per environments. It would be smaller and easier to maintain but would limit differences between enviroments to what can be variablized.

This sample also assume that you have an AWS account and its access preconfigured.

The container deployed by this implementation will only be reachable from the cluster local network as no service or ingress is deployed with it and the scope doesn't include a network route to the internet. 

Additionnaly, given the choice, I wouldn't use terraform to manage directly docker images when more addapted solutions like helm and operators exists.