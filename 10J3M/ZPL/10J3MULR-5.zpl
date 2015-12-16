set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.1589, <2> 3.6777, <3> 17.3767, <4> 11.4474, <5> 29.2346, <6> 31.5518, <7> 47.6635, <8> 10.1289, <9> 26.0943, <10> 29.0182;
param workload[JOB] := <1> 19.7116, <2> 10.6647, <3> 9.3652, <4> 30.0761, <5> 36.3633, <6> 1.7078, <7> 22.0582, <8> 5.633, <9> 11.721, <10> 3.6926;
param capacity[MACHINE] := <1> 50.3312, <2> 50.3312, <3> 50.3312;

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
