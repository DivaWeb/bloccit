require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LabelsHelper. For example:
#
# describe LabelsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LabelsHelper, type: :helper do

  let(:topic) { create(:topic) }
      let(:user) { create(:user) }
      let(:post) { create(:post) }
      
      let(:label) { create(:label) }
      let(:label2) { Label.create!(name: 'Another label') }

      it { is_expected.to have_many :labelings }
      it { is_expected.to have_many(:topics).through(:labelings) }
       it { is_expected.to have_many(:posts).through(:labelings) }

       describe "labelings" do
           it "allows the same label to be associated with a different topic and post" do
               topic.labels << label
               post.labels << label
               topic_label = topic.labels[0]
               post_label = post.labels[0]
               expect(topic_label).to eq(post_label)
           end
       end

       describe ".update_labels" do
           it "takes a comma delimited string and returns an array of Labels" do
               labels = "#{label.name}, #{label2.name}"
               labels_as_a = [label, label2]
               expect(Label.update_labels(labels)).to eq(labels_as_a)
           end
       end
  end
