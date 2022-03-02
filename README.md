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