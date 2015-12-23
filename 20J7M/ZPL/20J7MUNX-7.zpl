set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5022, <2> 30.3714, <3> 14.5806, <4> 32.8981, <5> 3.83, <6> 5.3961, <7> 21.4733, <8> 11.7624, <9> 39.0289, <10> 6.7192, <11> 13.9331, <12> 49.3594, <13> 13.5045, <14> 37.7056, <15> 21.9161, <16> 46.5331, <17> 43.1588, <18> 39.3271, <19> 33.2494, <20> 11.5323;
param workload[JOB] := <1> 6.671, <2> 5.511, <3> 3.8185, <4> 5.7357, <5> 1.957, <6> 2.323, <7> 4.6339, <8> 3.4296, <9> 6.2473, <10> 2.5921, <11> 3.7327, <12> 7.0256, <13> 3.6748, <14> 6.1405, <15> 4.6815, <16> 6.8215, <17> 6.5695, <18> 6.2711, <19> 5.7662, <20> 3.3959;
param capacity[MACHINE] := <1> 96.9984, <2> 96.9984, <3> 96.9984, <4> 96.9984, <5> 96.9984, <6> 96.9984, <7> 96.9984;

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
