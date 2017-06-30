С процессом установки 
	ruby
	
	rails
	
	sqlite3
	
	gem
	
	bundler
	
можно ознакомиться на http://rusrails.ru/getting-started-with-rails

После установки необходимого, нужно склонировать приложение из репозитория

	git clone https://gitlab.com/NACILON/RoR_fb_shares_read_gem.git

Потом, чтобы войти в папку приложения, выполните следующую команду

	cd RoR_fb_shares_read_gem
	
Чтобы установить все зависимости проекта - нужно выполнить команду 
	
	bundle install

или 
	
	sudo bundle install

, если возникли проблемы с доступом на запись


Запустить создание базы данных и миграции

	"rails db:create"
	------------------------------------------
	если получили сообщение 'already exist'
	
	выполните "rails db:drop" чтобы очистить старую БД, при надобности, потом "rails db:create"
	------------------------------------------
	выполните "rails db:migrate" чтобы заполнить БД нужнымы для работы гема таблицами

Приложение готово к использованию

	bundle exec rake meter:parse['nike.com',12]
	
Если запустить task следующей командой

	bundle exec rake meter:parse['nike.com']
	
то, по умолчанию, будет выставлен лимит в 300 страниц