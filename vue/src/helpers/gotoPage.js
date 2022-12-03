import eventBase from '@/eventBase';

export default function gotoPage(pageName, pageParams) {
  eventBase.$emit('gotoPage', pageName, pageParams);
}
