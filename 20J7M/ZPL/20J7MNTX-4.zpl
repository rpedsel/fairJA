set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6693, <2> 22.2984, <3> 30.6953, <4> 28.7628, <5> 26.7978, <6> 23.2697, <7> 25.6544, <8> 26.132, <9> 22.3668, <10> 22.9244, <11> 26.4329, <12> 30.5508, <13> 25.9664, <14> 26.3792, <15> 26.0194, <16> 24.9169, <17> 14.9685, <18> 22.4435, <19> 29.3553, <20> 22.5645;
param workload[JOB] := <1> 4.655, <2> 4.7221, <3> 5.5403, <4> 5.3631, <5> 5.1767, <6> 4.8239, <7> 5.065, <8> 5.1119, <9> 4.7294, <10> 4.7879, <11> 5.1413, <12> 5.5273, <13> 5.0957, <14> 5.1361, <15> 5.1009, <16> 4.9917, <17> 3.8689, <18> 4.7375, <19> 5.4181, <20> 4.7502;
param capacity[MACHINE] := <1> 10.6867, <2> 10.6867, <3> 10.6867, <4> 10.6867, <5> 10.6867, <6> 10.6867, <7> 10.6867;

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
