require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'Valid tutor inputs' do
    it 'First name should be as it is inside the tutor' do
      tutor = Tutor.create(first_name: 'Jim', last_name: 'Beam',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: 10,
                           experience: 3)

      expect(tutor).to be_valid
    end
  end

  describe 'Invalid tutor inputs' do
    it 'First name should be invalid' do
      tutor = Tutor.create(first_name: '', last_name: 'Beam',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: 10,
                           experience: 3)

      expect(tutor).not_to be_valid
    end

    it 'Last name should be invalid' do
      tutor = Tutor.create(first_name: '', last_name: '',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: 10,
                           experience: 3)

      expect(tutor).not_to be_valid
    end

    it 'Photo url should be invalid' do
      tutor = Tutor.create(first_name: 'Jim', last_name: 'Beam', photo_url: '',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: 10,
                           experience: 3)

      expect(tutor).not_to be_valid
    end

    it 'description should be invalid' do
      tutor = Tutor.create(first_name: 'Jim', last_name: 'Beam',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is',
                           hourly_fee: 10,
                           experience: 3)

      expect(tutor).not_to be_valid
    end

    it 'Hourly fee should be invalid' do
      tutor = Tutor.create(first_name: 'Jim', last_name: 'Beam',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: '',
                           experience: 3)

      expect(tutor).not_to be_valid
    end

    it 'Experience should be invalid' do
      tutor = Tutor.create(first_name: 'Jim', last_name: 'Beam',
                           photo_url: 'https://t3.ftcdn.net/jpg/03/05/77/64/360_F_305776453_t7SUl48g63zLsyODxd60aj6EcWR9avVK.jpg',
                           description: 'Jim is a highschool teacher with 3 years of experience. He knows about Thales',
                           hourly_fee: 10,
                           experience: '')

      expect(tutor).not_to be_valid
    end
  end
end
