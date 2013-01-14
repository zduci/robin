require 'runner'
require 'vcr'

EXPECTED_HOME_TIMELINE = <<EOF
RT @lancewalton: Performance Related Pay for school teachers is lunacy. Pay teachers more and remove almost all performance measures.
RT @BCS_Agile: Honoured that @kjscotland &amp; @PatrickSteyaert will be speakers at the @BCS London Lean #Kanban Day - 16 Mar #LLKD13 http://t.co/DbowsYmZ
RT @ohmrgrumpycat: I'm that horrible friend that reads your text then puts the phone down to do something and forgets to reply until 3 hours later.
RT @maniactive: I don't believe in the advice "get out of your comfort zone". I believe in expanding your zone of comfort to include more weird stuff.
RT @scotrubyconf: So @paulanthonywils decided to pretend he could do devops on a Sunday night. In other news, the website is temporarily offline.
RT @bphogan: If criticism of your favorite programming language makes you angry, you don't know nearly enough programming languages.
Oracle: "A [Java] fix will be available shortly": http://t.co/qFkocQTK &lt;- oh nice, then Java will be safe again until next Tuesday!
All folks #critcode should enjoy Knuth's close reading of the source code of "Adventure" http://t.co/5WD4kcjo
(digital) humanities and darkness http://t.co/ehtA45rV
RT @Erica_Jane_MP: Oh, FUCK NO.@guardian Top story = Private NHS providers in line for corporation tax exemption http://t.co/FWsrxqm3
RT @DepressedDarth: You're never too old to pretend you're a Jedi and wave your hand at a supermarket door to open it.
RT @timberners_lee: Aaron dead.
World wanderers, we have lost a wise elder.
Hackers for right, we are one down.
Parents all, we have lost a child. Let us weep.
RT @DepressedDarth: 'Bring Your Child to Work Day' got a lot more awkward after Luke destroyed the Death Star.
Got some sledging in today with the wee-uns #uksnow 3/10
RT @ourfounder: Lean does not preclude having a strategy, planning, or estimating. It does change the way you do them significantly. #agile #pkflow #kanban
RT @ctford The code of my @clojure_conj talk on music (http://t.co/y8o2Xqr0) is on Github  http://t.co/lidFUOrW #Clojure
RT @AntiJokeCat: What do an eagle and a mole have in common? They both live underground, except for the eagle.
I can feel my back. I'd really prefer not to.
@coreyhaines @sarah11918 She's just a solipsist.
Hey @sramsay, I wonder what you'd think of http://t.co/455yw8DP in light of 'algorithmic criticism'.
EOF

describe 'robin' do
  it 'fetches the user\'s home timeline' do
    VCR.use_cassette('home_timeline') do
      Runner.run
      Runner.output.should == EXPECTED_HOME_TIMELINE
    end
  end
end
