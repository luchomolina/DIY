
sqlite:
	# new.sql is a mangled mysqldump, since SQL::Translator
	# doesn't like LOCK/UNLOCK, KEY or bit(N)
	sqlt -f MySQL -t SQLite new.sql > sqlite.sql
	sqlite3 cash.db < sqlite.sql
