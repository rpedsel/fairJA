set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.9497, <2> 35.9026, <3> 5.8296, <4> 46.5417, <5> 5.7823, <6> 40.7554, <7> 21.1954, <8> 31.0209, <9> 8.1074, <10> 3.174, <11> 46.9418, <12> 35.1368, <13> 15.6253, <14> 35.9619, <15> 45.9351, <16> 1.6922, <17> 33.2354, <18> 8.1733, <19> 48.0412, <20> 28.3439;
param workload[JOB] := <1> 1.9874, <2> 5.9919, <3> 2.4145, <4> 6.8221, <5> 2.4046, <6> 6.384, <7> 4.6038, <8> 5.5696, <9> 2.8473, <10> 1.7816, <11> 6.8514, <12> 5.9276, <13> 3.9529, <14> 5.9968, <15> 6.7775, <16> 1.3008, <17> 5.765, <18> 2.8589, <19> 6.9312, <20> 5.3239;
param capacity[MACHINE] := <1> 9.91, <2> 9.91, <3> 9.91, <4> 9.91, <5> 9.91, <6> 9.91, <7> 9.91;

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
