feature 'Enter player' do
   scenario 'submitting a name' do

    visit('/')

     fill_in :contestant_2_name, with: "bob"
     click_button "Submit"

   expect(page).to have_content "bob"
   end
 end
