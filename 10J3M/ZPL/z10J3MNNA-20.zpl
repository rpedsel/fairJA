set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.4483, <2> 28.3334, <3> 28.4135, <4> 13.464, <5> 34.0589, <6> 27.1262, <7> 31.0659, <8> 21.7182, <9> 30.8081, <10> 27.767;
param workload[JOB] := <1> 927.099, <2> 802.7816, <3> 807.327, <4> 181.2793, <5> 1160.0087, <6> 735.8307, <7> 965.0901, <8> 471.6802, <9> 949.139, <10> 771.0063;
param capacity[MACHINE] := <1> 7771.2419, <2> 7771.2419, <3> 7771.2419;

var x[JM] binary;
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
