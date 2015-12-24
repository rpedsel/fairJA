set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.772, <2> 35.866, <3> 24.377, <4> 28.4112, <5> 21.6647, <6> 33.0938, <7> 24.736, <8> 31.8837, <9> 25.3512, <10> 23.9452;
param workload[JOB] := <1> 4.666, <2> 5.9888, <3> 4.9373, <4> 5.3302, <5> 4.6545, <6> 5.7527, <7> 4.9735, <8> 5.6466, <9> 5.035, <10> 4.8934;
param capacity[MACHINE] := <1> 12.9695, <2> 12.9695, <3> 12.9695;

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
