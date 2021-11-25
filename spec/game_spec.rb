require 'game'
    #-----------DEPOT CLASS-------------##

    describe depot = Environment::Depot.new do
        it 'should match simple_transportation_pack values' do
            expect(subject.packs[:simple_transportation_pack][:intelligence]).to include(:cellphone)
            expect(subject.packs[:simple_transportation_pack][:items]).to include(:medipack).and include(:chevy_versa)
        end
        it 'should match standard_transportation_pack values' do
            expect(subject.packs[:standard_transportation_pack][:intelligence]).to include(:cellphone).and include(:antenna)
            expect(subject.packs[:standard_transportation_pack][:arsenal]).to include(:colt_1911)
            expect(subject.packs[:standard_transportation_pack][:items]).to include(:handcuffs).and include(:medipack).and include(:chemistry).and include(:chevy_versa)
        end
        it 'should match simple_mission_pack values' do
            expect(subject.packs[:simple_mission_pack][:intelligence]).to include(:infopack).and include(:laptop).and include(:cellphone).and include(:antenna)
            expect(subject.packs[:simple_mission_pack][:arsenal]).to include(:colt_1911)
            expect(subject.packs[:simple_mission_pack][:items]).to include(:handcuffs).and include(:medipack).and include(:chemistry).and include(:financial)
        end
        it 'should match standard_mission_pack values' do
            expect(subject.packs[:standard_mission_pack][:intelligence]).to include(:infopack).and include(:laptop).and include(:cellphone).and include(:antenna)
            expect(subject.packs[:standard_mission_pack][:arsenal]).to include(:remmington_870).and include(:colt_1911).and include(:machete).and include(:hatchet)
            expect(subject.packs[:standard_mission_pack][:items]).to include(:handcuffs).and include(:medipack).and include(:chemistry).and include(:financial)
        end
    end

    #-----------CONTROL CLASS-------------##

    describe Environment::Control.new do  
        it 'should match control class parameters' do
            subject.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
            expect(subject.missions.keys).to include(:alpha)
            expect(subject.missions[:alpha][:status]).to eq(:active)
            expect(subject.missions[:alpha][:objective]).to eq('Get Alpha to the base')
            expect(subject.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
        end
        it 'should check the respond_to clause' do
            expect(subject.respond_to?(:set_mission_to_paused)).to be(true)
            expect(subject.respond_to?(:set_mission_to_aborted)).to be(true)
            expect(subject.respond_to?(:set_mission_to_failed)).to be(true)
            expect(subject.respond_to?(:set_mission_to_accomplished)).to be(true)
        end
    end

    #-----------HUMAN CLASS-------------##
    
    describe Environment::Human.new name: 'Diego' do
        it 'should match human class data' do
            expect(subject.name).to eq({:name => 'Diego'})
            expect(subject.id).not_to be_nil
            expect(subject).to respond_to(:set_personal_data).and be_truthy
            expect(subject).to respond_to(:set_professional_data).and be_truthy
        end
    end

    #-----------WORKER CLASS-------------##

    describe Environment::Worker.new'Juan' do
        it 'should match personal data' do
            subject.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
            expect(subject.personal_data[:surname]).to eq('Silva')
            expect(subject.personal_data[:age]).to eq(40)
            expect(subject.personal_data[:marital_status]).to eq(:single)
            expect(subject.personal_data[:children]).to eq(0)
            expect(subject.personal_data[:country]).to eq(:mx)
            expect(subject.personal_data[:language]).to eq(:es)
        end
        it 'should match professional data' do
            subject.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
            expect(subject.professional_data[:position]).to eq('SE')
            expect(subject.professional_data[:occupation]).to eq('IT')
            expect(subject.professional_data[:skills]).to include(:ruby).and include(:blender)
            expect(subject.professional_data[:observations]).to eq('none')
        end
    end