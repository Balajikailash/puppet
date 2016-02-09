class base {
include ssh
include cron
include git
}

node 'balaji-app1' {
include base
include app
}

node 'balaji-app2' {
include base
include app
}

node 'balaji-mysql' {
include base
include mysql
}

node 'balaji-jenkins' {
include base
include jenkins
}

