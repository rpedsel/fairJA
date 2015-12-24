set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1183, <2> 20.3741, <3> 20.4274, <4> 17.3078, <5> 23.4463, <6> 27.5609, <7> 21.4575, <8> 25.1294, <9> 22.3327, <10> 21.0236;
param workload[JOB] := <1> 10.0905, <2> 38.1422, <3> 32.398, <4> 32.0998, <5> 4.9967, <6> 45.7863, <7> 4.6194, <8> 40.9181, <9> 16.2401, <10> 12.7325;
param capacity[MACHINE] := <1> 238.0236, <2> 238.0236, <3> 238.0236;

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
