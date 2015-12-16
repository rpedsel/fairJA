set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.6338, <2> 5.1419, <3> 34.5302, <4> 0.1812, <5> 30.0517, <6> 10.3765, <7> 48.2237, <8> 33.7254, <9> 18.6863, <10> 49.5974, <11> 19.6426, <12> 16.1329, <13> 11.2174, <14> 30.654, <15> 36.1793, <16> 5.4581, <17> 18.2963, <18> 3.8604, <19> 31.3664, <20> 34.0137;
param workload[JOB] := <1> 12.6338, <2> 5.1419, <3> 34.5302, <4> 0.1812, <5> 30.0517, <6> 10.3765, <7> 48.2237, <8> 33.7254, <9> 18.6863, <10> 49.5974, <11> 19.6426, <12> 16.1329, <13> 11.2174, <14> 30.654, <15> 36.1793, <16> 5.4581, <17> 18.2963, <18> 3.8604, <19> 31.3664, <20> 34.0137;
param capacity[MACHINE] := <1> 56.2462, <2> 56.2462, <3> 56.2462, <4> 56.2462, <5> 56.2462, <6> 56.2462;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
