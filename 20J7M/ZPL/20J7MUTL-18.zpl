set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.4549, <2> 11.5611, <3> 33.6982, <4> 6.0592, <5> 44.0864, <6> 10.7203, <7> 28.8285, <8> 0.8173, <9> 0.862, <10> 21.9572, <11> 6.4663, <12> 25.6852, <13> 2.661, <14> 7.7291, <15> 15.9518, <16> 11.5334, <17> 30.6069, <18> 48.8876, <19> 19.4556, <20> 37.24;
param workload[JOB] := <1> 4.4549, <2> 11.5611, <3> 33.6982, <4> 6.0592, <5> 44.0864, <6> 10.7203, <7> 28.8285, <8> 0.8173, <9> 0.862, <10> 21.9572, <11> 6.4663, <12> 25.6852, <13> 2.661, <14> 7.7291, <15> 15.9518, <16> 11.5334, <17> 30.6069, <18> 48.8876, <19> 19.4556, <20> 37.24;
param capacity[MACHINE] := <1> 39.5638, <2> 39.5638, <3> 39.5638, <4> 39.5638, <5> 39.5638, <6> 39.5638, <7> 39.5638;

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
