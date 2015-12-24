set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.7986, <2> 26.5771, <3> 4.6644, <4> 49.3701, <5> 28.635, <6> 30.0235, <7> 47.2249, <8> 9.8312, <9> 24.7621, <10> 31.819;
param workload[JOB] := <1> 13.3214, <2> 24.6595, <3> 47.8906, <4> 25.4918, <5> 44.325, <6> 12.4731, <7> 40.4895, <8> 14.3443, <9> 41.5025, <10> 36.6854;
param capacity[MACHINE] := <1> 75.2958, <2> 75.2958, <3> 75.2958;

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
