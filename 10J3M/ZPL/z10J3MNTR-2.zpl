set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7283, <2> 21.7195, <3> 34.7059, <4> 17.9259, <5> 19.7907, <6> 15.4186, <7> 25.7023, <8> 25.3385, <9> 28.8803, <10> 32.0563;
param workload[JOB] := <1> 42.9801, <2> 12.31, <3> 1.9205, <4> 2.8092, <5> 46.7722, <6> 40.5492, <7> 30.5195, <8> 34.2367, <9> 40.4134, <10> 41.42;
param capacity[MACHINE] := <1> 73.4827, <2> 73.4827, <3> 73.4827;

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
