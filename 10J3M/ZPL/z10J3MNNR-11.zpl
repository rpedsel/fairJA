set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5909, <2> 27.0963, <3> 15.7483, <4> 29.8025, <5> 34.2505, <6> 25.0006, <7> 17.9582, <8> 22.9463, <9> 24.379, <10> 27.6671;
param workload[JOB] := <1> 32.9317, <2> 19.7183, <3> 9.6151, <4> 14.2906, <5> 31.4565, <6> 25.3896, <7> 1.9273, <8> 26.7879, <9> 32.7129, <10> 11.5968;
param capacity[MACHINE] := <1> 206.4267, <2> 206.4267, <3> 206.4267;

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
