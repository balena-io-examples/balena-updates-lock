# balena-updates-lock

A simple project to use `flock` to create an update lock that prevents
updating your application by the balena supervisor.

The example is based on [Elegant Locking of BASH Program](http://www.kfirlavi.com/blog/2012/11/06/elegant-locking-of-bash-program/)
blogpost.

Background: update locking relies on creating an exclusive lock on
`/tmp/balena/updates.lock`, and while that lock is maintained, the supervisor
will only download but not update the application container. When the lock
is removed or overridden (through the API or the dashboard), the application
container is updated. (See the [documentation]()https://www.balena.io/docs/learn/deploy/release-strategy/update-locking/
for more details).

To create this lockfile, you can use utilities in many languages, eg. the
[locfile](https://www.npmjs.com/package/lockfile) module in Node.js, which allows
smart lockfile management. The example here tries to be minimal in terms of requirements.
