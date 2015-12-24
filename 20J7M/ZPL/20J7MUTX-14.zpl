set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.5599, <2> 49.2598, <3> 23.7534, <4> 28.3627, <5> 39.8194, <6> 35.3349, <7> 20.4317, <8> 38.6152, <9> 19.0523, <10> 42.1101, <11> 26.7321, <12> 9.7091, <13> 44.7041, <14> 18.2442, <15> 15.5126, <16> 2.2511, <17> 3.9286, <18> 17.9821, <19> 33.4071, <20> 26.4693;
param workload[JOB] := <1> 4.0694, <2> 7.0185, <3> 4.8737, <4> 5.3257, <5> 6.3103, <6> 5.9443, <7> 4.5201, <8> 6.2141, <9> 4.3649, <10> 6.4892, <11> 5.1703, <12> 3.1159, <13> 6.6861, <14> 4.2713, <15> 3.9386, <16> 1.5004, <17> 1.9821, <18> 4.2405, <19> 5.7799, <20> 5.1448;
param capacity[MACHINE] := <1> 10.3886, <2> 10.3886, <3> 10.3886, <4> 10.3886, <5> 10.3886, <6> 10.3886, <7> 10.3886;

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
