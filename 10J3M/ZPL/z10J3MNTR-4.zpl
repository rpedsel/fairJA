set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7969, <2> 28.5615, <3> 29.3524, <4> 23.1692, <5> 22.8469, <6> 30.9508, <7> 23.6543, <8> 26.7436, <9> 34.6587, <10> 13.9769;
param workload[JOB] := <1> 44.0652, <2> 36.6364, <3> 25.2884, <4> 19.8923, <5> 35.9973, <6> 8.9014, <7> 37.5273, <8> 20.0846, <9> 24.2855, <10> 33.5228;
param capacity[MACHINE] := <1> 71.5503, <2> 71.5503, <3> 71.5503;

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
