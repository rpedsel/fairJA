set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.303, <2> 46.7755, <3> 27.7621, <4> 30.8314, <5> 0.0043, <6> 0.8533, <7> 9.7384, <8> 33.3671, <9> 35.1309, <10> 35.0663;
param workload[JOB] := <1> 5.4132, <2> 6.8393, <3> 5.269, <4> 5.5526, <5> 0.0656, <6> 0.9237, <7> 3.1206, <8> 5.7764, <9> 5.9271, <10> 5.9217;
param capacity[MACHINE] := <1> 44.8092, <2> 44.8092, <3> 44.8092;

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
