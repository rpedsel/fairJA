set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3122, <2> 23.6191, <3> 27.9305, <4> 25.1435, <5> 23.026, <6> 27.8532, <7> 25.9695, <8> 29.8154, <9> 26.4455, <10> 31.1054;
param workload[JOB] := <1> 21.6572, <2> 27.501, <3> 45.8764, <4> 14.0699, <5> 32.6878, <6> 10.5891, <7> 40.3405, <8> 46.4053, <9> 15.8247, <10> 17.9604;
param capacity[MACHINE] := <1> 68.2281, <2> 68.2281, <3> 68.2281;

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
