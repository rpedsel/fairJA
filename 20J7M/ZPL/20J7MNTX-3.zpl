set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.6118, <2> 23.8844, <3> 14.1059, <4> 23.7507, <5> 32.2388, <6> 21.5238, <7> 21.6958, <8> 27.3116, <9> 30.9721, <10> 26.4559, <11> 25.4124, <12> 33.2327, <13> 16.8505, <14> 26.6975, <15> 15.3568, <16> 19.3511, <17> 26.1409, <18> 25.2369, <19> 23.5185, <20> 27.6467;
param workload[JOB] := <1> 4.0758, <2> 4.8872, <3> 3.7558, <4> 4.8735, <5> 5.6779, <6> 4.6394, <7> 4.6579, <8> 5.2261, <9> 5.5653, <10> 5.1435, <11> 5.0411, <12> 5.7648, <13> 4.1049, <14> 5.167, <15> 3.9188, <16> 4.399, <17> 5.1128, <18> 5.0236, <19> 4.8496, <20> 5.258;
param capacity[MACHINE] := <1> 10.408, <2> 10.408, <3> 10.408, <4> 10.408, <5> 10.408, <6> 10.408, <7> 10.408;

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
