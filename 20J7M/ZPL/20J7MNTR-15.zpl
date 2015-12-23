set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.167, <2> 22.4192, <3> 22.9297, <4> 25.4482, <5> 17.3085, <6> 24.4484, <7> 29.9306, <8> 23.5925, <9> 30.6102, <10> 23.7775, <11> 21.464, <12> 28.1239, <13> 20.5178, <14> 31.308, <15> 29.3746, <16> 25.0699, <17> 24.5045, <18> 30.903, <19> 30.4978, <20> 34.0036;
param workload[JOB] := <1> 12.4738, <2> 36.5518, <3> 1.6891, <4> 28.1153, <5> 31.9758, <6> 31.952, <7> 47.1698, <8> 22.5951, <9> 1.5804, <10> 13.4797, <11> 12.4096, <12> 44.6232, <13> 24.6872, <14> 17.3355, <15> 1.8591, <16> 8.0736, <17> 45.0208, <18> 20.7233, <19> 4.2963, <20> 11.0273;
param capacity[MACHINE] := <1> 44.747, <2> 44.747, <3> 44.747, <4> 44.747, <5> 44.747, <6> 44.747, <7> 44.747;

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
