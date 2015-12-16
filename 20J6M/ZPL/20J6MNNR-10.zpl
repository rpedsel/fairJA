set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.5506, <2> 21.5328, <3> 25.7009, <4> 22.2996, <5> 17.0321, <6> 28.302, <7> 36.7884, <8> 18.6776, <9> 29.5062, <10> 30.9282, <11> 30.1546, <12> 29.1877, <13> 20.5686, <14> 15.2553, <15> 25.0607, <16> 23.4303, <17> 24.3853, <18> 18.1559, <19> 24.2154, <20> 27.4901;
param workload[JOB] := <1> 17.2964, <2> 8.1333, <3> 8.0493, <4> 34.1823, <5> 21.9758, <6> 5.1698, <7> 1.6589, <8> 24.5924, <9> 44.7239, <10> 36.4626, <11> 42.8031, <12> 38.2323, <13> 17.0772, <14> 14.5776, <15> 30.5432, <16> 41.3502, <17> 48.5225, <18> 18.4224, <19> 2.7456, <20> 22.9739;
param capacity[MACHINE] := <1> 479.4927, <2> 479.4927, <3> 479.4927, <4> 479.4927, <5> 479.4927, <6> 479.4927;

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
