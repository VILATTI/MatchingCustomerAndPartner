describe 'FactoryBot factories' do
  FactoryBot.factories.each do |factory|
    describe "#{factory.name} factory" do
      next unless factory.build_class.method_defined?(:valid?)

      it 'is valid' do
        record = FactoryBot.build(factory.name)
        expect(record).to be_valid, -> { record.errors.full_messages.join("\n") }
      end

      factory.definition.defined_traits.each do |trait|
        it "is valid with trait #{trait.name}" do
          record = FactoryBot.build(factory.name, trait.name)
          expect(record).to be_valid, -> { record.errors.full_messages.join("\n") }
        end
      end
    end
  end
end
