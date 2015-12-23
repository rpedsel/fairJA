set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.9026, <2> 5.4418, <3> 30.685, <4> 37.4215, <5> 2.06, <6> 40.5528, <7> 20.485, <8> 18.8537, <9> 45.7076, <10> 13.3861, <11> 28.59, <12> 26.7322, <13> 33.4044, <14> 21.0011, <15> 35.9202, <16> 0.1119, <17> 37.5099, <18> 44.5142, <19> 14.9022, <20> 20.4926;
param workload[JOB] := <1> 6.2372, <2> 2.3328, <3> 5.5394, <4> 6.1173, <5> 1.4353, <6> 6.3681, <7> 4.526, <8> 4.3421, <9> 6.7607, <10> 3.6587, <11> 5.347, <12> 5.1703, <13> 5.7797, <14> 4.5827, <15> 5.9933, <16> 0.3345, <17> 6.1245, <18> 6.6719, <19> 3.8603, <20> 4.5269;
param capacity[MACHINE] := <1> 13.6727, <2> 13.6727, <3> 13.6727, <4> 13.6727, <5> 13.6727, <6> 13.6727, <7> 13.6727;

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
