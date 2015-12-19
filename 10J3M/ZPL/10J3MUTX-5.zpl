set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.9391, <2> 26.3986, <3> 18.311, <4> 29.021, <5> 9.6552, <6> 37.1597, <7> 1.6521, <8> 44.7283, <9> 23.9482, <10> 27.7469;
param workload[JOB] := <1> 0.9691, <2> 5.138, <3> 4.2791, <4> 5.3871, <5> 3.1073, <6> 6.0959, <7> 1.2853, <8> 6.6879, <9> 4.8937, <10> 5.2675;
param capacity[MACHINE] := <1> 10.7777, <2> 10.7777, <3> 10.7777;

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
