#
execute 'upgrade alembic' do
  command ' alembic --config development.ini upgrade head '
end

