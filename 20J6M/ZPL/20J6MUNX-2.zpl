set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.8233, <2> 38.8319, <3> 6.9227, <4> 17.6005, <5> 0.528, <6> 22.1223, <7> 42.2258, <8> 29.8583, <9> 42.4893, <10> 38.4603, <11> 7.2326, <12> 40.9045, <13> 47.275, <14> 24.2492, <15> 20.6392, <16> 40.8823, <17> 6.0703, <18> 44.0684, <19> 3.7534, <20> 36.5825;
param workload[JOB] := <1> 6.3893, <2> 6.2315, <3> 2.6311, <4> 4.1953, <5> 0.7266, <6> 4.7034, <7> 6.4981, <8> 5.4643, <9> 6.5184, <10> 6.2016, <11> 2.6893, <12> 6.3957, <13> 6.8757, <14> 4.9243, <15> 4.543, <16> 6.3939, <17> 2.4638, <18> 6.6384, <19> 1.9374, <20> 6.0483;
param capacity[MACHINE] := <1> 98.4694, <2> 98.4694, <3> 98.4694, <4> 98.4694, <5> 98.4694, <6> 98.4694;

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
