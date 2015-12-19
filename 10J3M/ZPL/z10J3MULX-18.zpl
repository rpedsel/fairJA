set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1182, <2> 0.0582, <3> 47.5186, <4> 32.1925, <5> 1.3822, <6> 37.7826, <7> 40.1103, <8> 6.595, <9> 43.7111, <10> 27.259;
param workload[JOB] := <1> 4.703, <2> 0.2412, <3> 6.8934, <4> 5.6738, <5> 1.1757, <6> 6.1468, <7> 6.3333, <8> 2.5681, <9> 6.6114, <10> 5.221;
param capacity[MACHINE] := <1> 15.1892, <2> 15.1892, <3> 15.1892;

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
