set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.8576, <2> 10.0626, <3> 20.9345, <4> 20.8206, <5> 26.7471, <6> 30.8463, <7> 27.0377, <8> 23.5902, <9> 31.8555, <10> 20.4425, <11> 30.9662, <12> 19.8399, <13> 25.6056, <14> 22.4352, <15> 32.0108, <16> 18.3972, <17> 23.6171, <18> 13.5796, <19> 17.6995, <20> 22.3276;
param workload[JOB] := <1> 18.8576, <2> 10.0626, <3> 20.9345, <4> 20.8206, <5> 26.7471, <6> 30.8463, <7> 27.0377, <8> 23.5902, <9> 31.8555, <10> 20.4425, <11> 30.9662, <12> 19.8399, <13> 25.6056, <14> 22.4352, <15> 32.0108, <16> 18.3972, <17> 23.6171, <18> 13.5796, <19> 17.6995, <20> 22.3276;
param capacity[MACHINE] := <1> 57.2092, <2> 57.2092, <3> 57.2092, <4> 57.2092, <5> 57.2092, <6> 57.2092;

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
