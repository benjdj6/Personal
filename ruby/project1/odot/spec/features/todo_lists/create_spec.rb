require 'spec_helper'

describe "Creating todo lists" do
	

	it "redirects to the todo list index page on success" do
		create_todo_list

		expect(page).to have_content("My todo list")
	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0);

		create_todo_list title: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0);

		visit "/todo_lists"
		expect(page).to_not have_content("This is my todo list.")
	end

	it "displays an error when the todo list has a title less than 3 characters" do
		expect(TodoList.count).to eq(0);

		create_todo_list title: "12"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0);

		visit "/todo_lists"
		expect(page).to_not have_content("This is my todo list.")
	end

	it "displays an error when the todo list has no description" do
		expect(TodoList.count).to eq(0);

		create_todo_list description: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0);

		visit "/todo_lists"
		expect(page).to_not have_content("My todo list")
	end

	it "displays an error when the todo list has no description" do
		expect(TodoList.count).to eq(0);

		create_todo_list title: "Grocery list", description: "four"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0);

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery list")
	end
end