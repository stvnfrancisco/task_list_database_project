require('rspec')
require('task')
require('pry')
require('pg')
require("spec_helper")

# DB = PG.connect({:dbname => 'to_do_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM tasks *;")
#   end
# end

describe(Task) do
  describe("#==") do
    it("it is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

  # before() do
  #   Task.clear()
  # end

  describe('#description') do
    it('lets you give it a description') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe(".all") do
    it("creates an empty array") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#list_id') do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end





  # describe('.clear') do
  #   it('clears all saved tasks') do
  #     Task.new({:description => "learn SQL"}).save()
  #     Task.clear()
  #     expect(Task.all()).to(eq([]))
  #   end
  # end

end
