# PAYARA_HOME=/path/to/payara (162 or 164)
export PAYARA_HOME=~/Java/ap-server/payara164

# copy JDBC driver
cp ~/Java/JDBC/postgresql-9.4.1212.jar $PAYARA_HOME/glassfish/lib

$PAYARA_HOME/bin/asadmin start-domain domain1

# create JDBC pool
$PAYARA_HOME/bin/asadmin create-jdbc-connection-pool --datasourceclassname org.postgresql.xa.PGXADataSource --restype javax.sql.XADataSource --property url=jdbc\\:postgresql\\://localhost\\:5432/ex:user=user:password=password ExPool

# ping
$PAYARA_HOME/bin/asadmin ping-connection-pool ExPool

# create JDBC resource
$PAYARA_HOME/bin/asadmin create-jdbc-resource --connectionpoolid ExPool jdbc/ex

# enable default-principal-to-role-mapping
$PAYARA_HOME/bin/asadmin set server-config.security-service.activate-default-principal-to-role-mapping=true

# create realm
$PAYARA_HOME/bin/asadmin create-auth-realm --classname com.sun.enterprise.security.auth.realm.jdbc.JDBCRealm \
--property jaas-context=jdbcRealm:datasource-jndi=jdbc/ex:user-table=users:\
user-name-column=login_id:password-column=encrypt_password:group-table=user_roles:\
group-name-column=role_name:digest-algorithm=SHA-256:\
digestrealm-password-enc-algorithm=digest-algorithm:encoding=Hex:charset=UTF-8 customer

$PAYARA_HOME/bin/asadmin stop-domain domain1
