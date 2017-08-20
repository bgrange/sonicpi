density 9 do
  
  live_loop :hh do
    sync :tick
    #sample :drum_cymbal_closed
    sleep 1
  end
  
  live_loop :sn do
    sync :tick
    c = choose([2,3,4,5,7,9,11])
    #sample :sn_zome, amp: choose([0.8,2]), rate: 1.3
    sleep c
    #sample :sn_zome, amp: choose([0.8,2]), rate: 1.3
    sleep c
  end
  
  live_loop :pulse do
    sync :tick
    #sample :bd_boom, amp: 15, finish: 0.1, release: 0.1
    sleep 4
  end
  
  live_loop :tick do
    cue :tick
    sleep 1
  end
  
end



live_loop :vibe do
  sample :bass_hard_c, amp: 9, rate: 0.5, attack: 2, release: 2, start: 0.3, finish: 0.7
  sleep 1
end

live_loop :vibe2 do
  #sample :bass_hard_c, amp: 2, rate: 1, attack: 2, release: 2
  sleep 0.2
end
live_loop :org do
  sample "/Users/ben/creative/recordings/a.aif", amp:40
  sleep 30
end
