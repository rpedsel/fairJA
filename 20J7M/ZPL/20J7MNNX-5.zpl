set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.6384, <2> 30.9849, <3> 20.605, <4> 22.9878, <5> 30.3553, <6> 27.412, <7> 25.111, <8> 33.0716, <9> 23.393, <10> 27.6328, <11> 19.8928, <12> 21.7903, <13> 17.3245, <14> 21.9397, <15> 22.0247, <16> 33.0766, <17> 22.7742, <18> 25.5339, <19> 30.7455, <20> 26.4003;
param workload[JOB] := <1> 3.9545, <2> 5.5664, <3> 4.5393, <4> 4.7946, <5> 5.5096, <6> 5.2356, <7> 5.0111, <8> 5.7508, <9> 4.8366, <10> 5.2567, <11> 4.4601, <12> 4.668, <13> 4.1623, <14> 4.684, <15> 4.693, <16> 5.7512, <17> 4.7722, <18> 5.0531, <19> 5.5449, <20> 5.1381;
param capacity[MACHINE] := <1> 99.3821, <2> 99.3821, <3> 99.3821, <4> 99.3821, <5> 99.3821, <6> 99.3821, <7> 99.3821;

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
