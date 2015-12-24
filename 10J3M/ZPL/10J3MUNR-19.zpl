set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.1185, <2> 6.7719, <3> 34.5048, <4> 18.0395, <5> 37.7026, <6> 4.3475, <7> 38.0644, <8> 31.5663, <9> 41.968, <10> 32.0042;
param workload[JOB] := <1> 42.6485, <2> 24.244, <3> 48.9563, <4> 7.1872, <5> 46.5773, <6> 5.4497, <7> 4.0207, <8> 45.3594, <9> 32.7274, <10> 42.8748;
param capacity[MACHINE] := <1> 300.0453, <2> 300.0453, <3> 300.0453;

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
