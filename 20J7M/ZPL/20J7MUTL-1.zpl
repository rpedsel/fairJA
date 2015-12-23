set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4828, <2> 18.128, <3> 27.7701, <4> 43.2109, <5> 49.0891, <6> 3.0318, <7> 16.84, <8> 12.1356, <9> 36.8766, <10> 13.7566, <11> 14.316, <12> 31.9545, <13> 7.2904, <14> 8.3015, <15> 31.6549, <16> 30.8451, <17> 3.8757, <18> 46.2017, <19> 24.224, <20> 45.9039;
param workload[JOB] := <1> 23.4828, <2> 18.128, <3> 27.7701, <4> 43.2109, <5> 49.0891, <6> 3.0318, <7> 16.84, <8> 12.1356, <9> 36.8766, <10> 13.7566, <11> 14.316, <12> 31.9545, <13> 7.2904, <14> 8.3015, <15> 31.6549, <16> 30.8451, <17> 3.8757, <18> 46.2017, <19> 24.224, <20> 45.9039;
param capacity[MACHINE] := <1> 52.381, <2> 52.381, <3> 52.381, <4> 52.381, <5> 52.381, <6> 52.381, <7> 52.381;

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
