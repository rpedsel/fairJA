set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6111, <2> 23.6849, <3> 26.7494, <4> 32.678, <5> 13.2482, <6> 17.249, <7> 22.509, <8> 27.2032, <9> 24.6017, <10> 15.7106, <11> 15.2839, <12> 32.8282, <13> 20.0814, <14> 30.7764, <15> 25.6811, <16> 25.887, <17> 30.4833, <18> 19.8717, <19> 18.8181, <20> 15.8448;
param workload[JOB] := <1> 5.1586, <2> 4.8667, <3> 5.172, <4> 5.7165, <5> 3.6398, <6> 4.1532, <7> 4.7444, <8> 5.2157, <9> 4.96, <10> 3.9637, <11> 3.9095, <12> 5.7296, <13> 4.4812, <14> 5.5476, <15> 5.0677, <16> 5.0879, <17> 5.5212, <18> 4.4578, <19> 4.338, <20> 3.9806;
param capacity[MACHINE] := <1> 15.952, <2> 15.952, <3> 15.952, <4> 15.952, <5> 15.952, <6> 15.952;

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
