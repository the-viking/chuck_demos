// make our patch
SinOsc s => JCRev r => dac;
SinOsc p => dac;
0 => int i;
0 => int reps;

1.0 => r.gain;
.5 => r.mix;

[ 150, 100, 50, 50 , 0, 50, 50, 300, 400 ] @=> int freqs[];
[ 3.0 , 0.5, 1, 1, 0.25, 2, 2, 1, 1 ] @=> float durs[];


// time-loop, in which the osc's frequency is changed every 100 ms
while( true ) {
  durs[i]*200::ms => now;
  freqs[i] => s.freq;
  if(reps > 4 * freqs.cap()) {
		freqs[i]*4 => p.freq;
  }
  i + 1 => i;
  reps + 1 => reps;
  if(i > freqs.cap()-1) {
		0 => i;
  }
}
