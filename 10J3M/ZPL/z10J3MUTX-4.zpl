set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.9272, <2> 44.4715, <3> 15.7283, <4> 11.7071, <5> 17.927, <6> 49.8711, <7> 20.2381, <8> 20.5834, <9> 8.3221, <10> 45.189;
param workload[JOB] := <1> 1.9817, <2> 6.6687, <3> 3.9659, <4> 3.4216, <5> 4.234, <6> 7.0619, <7> 4.4987, <8> 4.5369, <9> 2.8848, <10> 6.7223;
param capacity[MACHINE] := <1> 11.4941, <2> 11.4941, <3> 11.4941;

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
